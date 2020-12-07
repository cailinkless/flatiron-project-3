class ClosingValidator < ActiveModel::Validator 

    def validate(record)
        unless record.closing > record.opening
          record.errors[:closing] << "must be AFTER opening until we can support a time travel feature"
        end
    end

end