# frozen_string_literal: true

require 'yaml'
require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = CSV.parse(tsv, headers: true, col_sep: "\t").map(&:to_hash)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv_string = CSV.generate_line(@data[0].keys, col_sep: "\t")
    @data.each do |row|
      CSV.generate(tsv_string, col_sep: "\t") { |tsv| tsv << row.values }
    end
    tsv_string
  end
end
