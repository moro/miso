#!/usr/bin/env ruby
# coding:utf-8
$KCODE = 'u' if RUBY_VERSION < "1.9"
require 'rubygems'

$LOAD_PATH.unshift File.expand_path("../../../../", File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

RAILS_ENV="test"

# require File.expand_path("record_extention_test_util", File.dirname(__FILE__))
# RecrodExtention::TestUtil.setup
#
# # or
#
# require File.expand_path("setup_test_model", File.dirname(__FILE__))

