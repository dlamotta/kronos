-- Copyright (c) 2021 Kong, Inc.
-- All rights reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://opensource.org/licenses/BSD-3-Clause
--
-- Author: David La Motta
--
local kronos = {
  VERSION  = "1.0.0",
  PRIORITY = 10,
}

local strategies = {
  piglatin = require "kong.plugins.kronos.piglatin"
}

function kronos:init_worker()
  kong.log("kronos:init_worker")
end

function kronos:access(config)
  local strategy = strategies[config.strategy] 
  local args = kong.request.get_header("X-Args")
  local code, res = strategy.exec(args)

  if code == 500 then
    kong.log(err)
  end  

  return kong.response.exit(code, res)
end

return kronos
