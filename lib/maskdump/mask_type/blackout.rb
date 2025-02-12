require 'maskdump/mask_type/base'

module Maskdump
  module MaskType
    class Blackout < Base
      BLACKOUT_CHAR = "#"

      def mask
        records.each do |record|
          record[column_name] = process(record[column_name])
        end
      end

      private

      def process(record)
        return record unless record.is_a?(String)
        record.each_char.map{ BLACKOUT_CHAR }.join
      end
    end
  end
end
