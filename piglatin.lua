-- Copyright (c) 2021 Kong, Inc.
-- All rights reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://opensource.org/licenses/BSD-3-Clause
--
-- Author: David La Motta
--
local exec = require'resty.exec'
local prog = exec.new('/var/run/exec.sock')
local _M = {}

function _M.exec(args)
  local cmd = { "perl", "/root/piglatin.pl", args }
  prog.argv = cmd
  local res, err = prog()

  if err then
    return 500, err
  end  

  return 200, res.stdout
end

return _M
