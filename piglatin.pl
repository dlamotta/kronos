# Copyright (c) 2021 Kong, Inc.
# All rights reserved.
# 
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/BSD-3-Clause
#
# Author: David La Motta
# 
use Lingua::PigLatin 'piglatin';
print piglatin(@ARGV[0]);
