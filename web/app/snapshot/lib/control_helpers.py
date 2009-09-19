import logging
from snapshot.lib.dbinstance import DBInstance
from snapshot.lib.base import *
from paste.request import construct_url
from paste.httpexceptions import HTTPMovedPermanently

def urlify_timestamp(ts):
    return ts.strftime('%Y%m%dT%H%M%S')

def build_url_archive(archive, ts=None, path=None, isadir=True):
    crumbs = []

    url = request.environ.get('SCRIPT_NAME') + "/"
    url += 'archive/' + archive + "/"

    if not ts:
        return url

    url += urlify_timestamp(ts) + '/'

    if not path:
        return url

    if path != '/':
        for path_element in path.strip('/').split('/'):
            url += path_element + '/'

    if not isadir:
        url = url.rstrip('/')

    return url

def build_url_archive_ym_list(archive, year, month):
    url = build_url_archive(archive)
    ym = (year, month)
    url += "?year=%d&month=%d"%ym
    return url

def unicode_encode(path):
    if isinstance(path, unicode):
        return path.encode('utf-8')
    else:
        return path

def ensure_directory():
    if not request.environ['PATH_INFO'].endswith('/'):
        request.environ['PATH_INFO'] += '/'
        url = construct_url(request.environ)
        raise HTTPMovedPermanently(url)

# vim:set et:
# vim:set ts=4:
# vim:set shiftwidth=4:
