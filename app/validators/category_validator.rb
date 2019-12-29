class CategoryValidator < ActiveModel::Validator
  def validate(record)
    if record.category_id
      category = Category.find_by category_id: record.category_id
      unless category
        # return an error
        record.errors.add :category_id, 'can\'t be existed'
      end
    else
     record.errors.add :category_id, 'can\'t be blank'
    end
  end
end
