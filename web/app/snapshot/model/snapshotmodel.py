from snapshot.lib.dbinstance import DBInstance

class SnapshotModel:
    def __init__(self, pool):
        self.pool = pool

    def archives_get_list(self):
        db = DBInstance(self.pool)
        rows = db.query("SELECT name FROM archive ORDER BY name")
        db.close()
        return map(lambda x: x['name'], rows)

    def mirrorruns_get_yearmonths_from_archive(self, archive):
        db = DBInstance(self.pool)
        result = None

        rows = db.query("""SELECT archive_id FROM archive WHERE archive.name=%(name)s""",
            { 'name': archive })

        if len(rows) != 0:
            archive_id = rows[0]['archive_id']

            rows = db.query("""
                SELECT extract(year from run)::INTEGER AS year, to_char(extract(month from run), 'FM00') AS month
                  FROM mirrorrun
                  WHERE mirrorrun.archive_id=%(archive_id)s
                  GROUP BY year, month
                  ORDER BY year, month""",
                { 'archive_id': archive_id })

            # make an array like thus:
            #  - year: nnnn
            #    months:
            #      - nn
            #      - nn
            #  - year: nnnn
            #    months:
            #      - nn
            #      - nn
            #      - nn
            result = []
            for row in rows:
                y, m = row['year'], row['month']
                if len(result) == 0 or len[-1]['year'] != y:
                    result.append( { 'year': y, 'months': [] } )
                result[-1]['months'].append(m)

        db.close()
        return result

# vim:set et:
# vim:set ts=4:
# vim:set shiftwidth=4: