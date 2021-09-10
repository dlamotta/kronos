-- Copyright (c) 2021 Kong, Inc.
-- All rights reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://opensource.org/licenses/BSD-3-Clause
--
-- Author: David La Motta
--
local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local schema = {
  name = plugin_name,
  fields = {    
    {
      -- this plugin will only be applied to Consumers or Routes
      consumer = typedefs.no_service
    },
    {
      -- this plugin will only run within Nginx HTTP module
      protocols = typedefs.protocols_http
    },
    {
      config = {
        type = "record",
        fields = {
          { 
            strategy = { type = "string", required = true } 
          },
        },
      },
    },
  },
}

return schema
