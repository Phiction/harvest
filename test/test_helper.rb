$VERBOSE=nil
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "harvest"

require "minitest/autorun"
require "webmock/minitest"
require "vcr"

require "minitest/reporters"
Minitest::Reporters.use!
