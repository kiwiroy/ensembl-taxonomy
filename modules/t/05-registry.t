# Copyright [2009-2014] EMBL-European Bioinformatics Institute
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use strict;
use warnings;
use Test::More;

use Bio::EnsEMBL::TaxonomyNode;
use Bio::EnsEMBL::DBSQL::TaxonomyDBAdaptor;
use Bio::EnsEMBL::DBSQL::TaxonomyNodeAdaptor;

use FindBin qw($Bin);
my $conf_file = "$Bin/db.conf";

my $conf = do $conf_file
  || die "Could not load configuration from " . $conf_file;

$conf = $conf->{tax};

Bio::EnsEMBL::Registry->load_registry_from_db(
         -user   => $conf->{user},
	 -pass   => $conf->{pass},
	 -host   => $conf->{host},
	 -port   => $conf->{port},
	 -driver => $conf->{driver}
);

my $tax = Bio::EnsEMBL::Registry->get_DBAdaptor("multi","taxonomy");
ok(defined $tax,"Adaptor returned");
ok(ref($tax) eq 'Bio::EnsEMBL::DBSQL::TaxonomyDBAdaptor',"TaxonomyDBAdaptor returned");
my $node_tax = $tax->get_TaxonomyNodeAdaptor();
ok(defined $node_tax,"Adaptor returned");
ok(ref($node_tax) eq 'Bio::EnsEMBL::DBSQL::TaxonomyNodeAdaptor',"TaxonomyNodeAdaptor returned");
done_testing;
