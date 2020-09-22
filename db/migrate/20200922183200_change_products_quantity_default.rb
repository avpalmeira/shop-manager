class ChangeProductsQuantityDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :products, :quantity, 0
  end
end
