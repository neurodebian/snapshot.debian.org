import logging
from snapshot.lib.base import *
from snapshot.lib.dbinstance import DBInstance

log = logging.getLogger(__name__)

class RootController(BaseController):
    def index(self):
        db = DBInstance(g.pool)
        c.names = g.shm.archives_get_list(db)
        db.close()
        return render('/root.mako')

# vim:set et:
# vim:set ts=4:
# vim:set shiftwidth=4:
