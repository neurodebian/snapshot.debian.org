<h1>News</h1>
<h2>2017-09-21</h2>
<p>
Imports of the debian-ports and debian-debug suite had failed for the last
three weeks as individual files in those archives have exceeded the size
representable in our database schema.  We have now updated the database to
support file sizes up to 9,223,372,036,854,775,807 Bytes (2<sup>63</sup>-1; 8
EiB).  Just like 640KB in ancient times, this will be truly sufficient
indefinitely.

<h2>2014-06-01</h2>
<p>
We added a cluster of machines generously provided by <a
href="http://www.leaseweb.com/">LeaseWeb</a> to provide the snapshot.debian.org
service.
</p>
<p>
Snapshot used to run on two machines hosted at and provided by the <a
href="http://www.sanger.ac.uk/">Wellcome Trust Sanger Institute</a> and by the
<a href="http://www.ece.ubc.ca/">Electrical and Computer Engineering</a>
department at the University of British Columbia, Canada.  A few months ago,
the machine at UBC, named <code>stabile.debian.org</code>, started to die.
Since it was approaching its storage capacity limits anyway, we began looking
for a new second home for snapshot, and LeaseWeb offered!  Providing snapshot
from two different places (now Sanger and LeaseWeb) allows us to survive
temporary and not-so-temporary issues that affect any single site.</p>
<p>
Currently, snapshot consists of 24 terabytes of data in about 15 million files,
and it appears to be growing at a rate of approximately 5 terabytes a year (or
about 10 megabytes per minute).
</p>

<h2>2012-09-23</h2>
<p>
Just a quick datapoint: Currently snapshot has about 11 million files in a bit
over 16 terabytes of data.
</p>

<h2>2010-12-14</h2>
<p>
Around 2010-11-20 the server which hosted snapshot-master stumbled into
hardware issues. This did not affect the external storage but only the front-end
server.  Since the master was down no new data was imported into the snapshot
system and the remaining mirror kept presenting its data as of the 20th.
</p>
<p>
Fortunately the people at the <a href="http://www.sanger.ac.uk/">Wellcome Trust
Sanger Institute</a>, which hosts snapshot-master, have been able to give us
a replacement machine quite quickly.  Thanks!
</p>
<p>
While the master was down, snapshot information was collected by a non-public
backup system.  This data has been integrated into snapshot.debian.org.
Unfortunately, one of the package pools, <code>debian-ports</code>, was not
archived on that secondary system, and for this archive we have no data
in the affected time period.
</p>

<h2>2010-09-07</h2>
<p>
Renamed the backports.org archive to debian-backports as it has now
<a href="http://lists.debian.org/20100905211658.GH7615@lisa.snow-crash.org">moved
to debian.org infrastructure</a>.  A rewrite rule has been put in place
so old URLs should continue to work (at least for HTTP clients that know
how to follow HTTP redirects).
</p>

<h2>2010-08-16</h2>
<p>
Set up a caching proxy in front of the two snapshot webservers.  This will help
in cases where an entire organisation uses various apt sources.list entries on
a lot of their machines.
</p>
<p>
Usually such entities would use proxy caches like squid and then there is no
problem, assuming the cache works correctly.  Unfortunately apt-cacher, apparently
a common choice which is supposed to be smarter for debian archives, completely ignores the
Cache-Control headers that snapshot sends and hits this service for all
requests made to anything under <code>dist/</code>.  A single <code>apt-get
update</code> can cause up to a few dozen of such requests and when multiplied
by scores of machines - all running the update at the same time - this caused
the snapshot backend to run into limits.  Now such requests won't hit the backend
any more.
</p>

<h2>2010-04-12</h2>
<p>
Publicly <a href="http://www.debian.org/News/2010/20100412">announce the snapshot.debian.org service</a>.  Yay.
</p>

<hr style="height:1px;" />
<p>For older entries see <a href="oldnews">the older news page</a>.</p>
