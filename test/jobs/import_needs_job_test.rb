require 'test_helper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end

class ImportNeedsJobTest < ActiveJob::TestCase

  setup do
    Need.destroy_all
  end

  test "imports the right amount of data" do
    VCR.use_cassette("needs") do
      needs = APIImporter.needs
      ImportNeedsJob.perform_now
      needs_count = needs.count
      records_count = Need.count
      assert_equal needs_count, records_count
    end
  end
end
