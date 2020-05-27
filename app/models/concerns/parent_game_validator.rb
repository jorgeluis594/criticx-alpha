class ParentGameValidator < ActiveModel::Validator
  def validate(record)
    if record.category == 'expansion'
      validar = Game.find(record.parent_id) rescue nil
      unless validar
        record.errors[:parent_id] << "parent_id not found"
      end
    end
  end
end