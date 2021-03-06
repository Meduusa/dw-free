# This code was forked from the LiveJournal project owned and operated
# by Live Journal, Inc. The code has been modified and expanded by
# Dreamwidth Studios, LLC. These files were originally licensed under
# the terms of the license supplied by Live Journal, Inc, which can
# currently be found at:
#
# http://code.livejournal.org/trac/livejournal/browser/trunk/LICENSE-LiveJournal.txt
#
# In accordance with the original license, this code and all its
# modifications are provided under the GNU General Public License.
# A copy of that license can be found in the LICENSE file included as
# part of this distribution.

# new_entry
#         URL
#         journal.userid
#         journal.user
#         poster.caps
#         journal.caps
#         journal.type
#         ditemid
#         security {public, protected, private}


package LJ::EventLogRecord::NewEntry;

use strict;
use base 'LJ::EventLogRecord';
use Carp qw (croak);

sub new {
    my ($class, $e) = @_;

    croak "Must pass an LJ::Entry"
        unless UNIVERSAL::isa($e, 'LJ::Entry');

    my %args = (
                'ditemid'        => $e->ditemid,
                'journal.userid' => $e->journal->userid,
                'journal.user'   => $e->journal->user,
                'poster.caps'    => $e->poster->caps,
                'poster.userid'  => $e->poster->userid,
                'journal.caps'   => $e->journal->caps,
                'journal.type'   => $e->journal->journaltype,
                'security'       => $e->security,
                );

    return $class->SUPER::new(%args);
}

sub event_type { 'new_entry' }

1;
