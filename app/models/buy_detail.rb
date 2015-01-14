class BuyDetail < ActiveRecord::Base
  belongs_to :buy
  belongs_to :state
  belongs_to :model

  validates :model, :state, presence: true

  before_save :calculate_price!

  def calculate_price
    (model.price * state.factor) / 100
  end

  def self.to_csv(options = {})
    CSV.generate(col_sep: "\t") do |csv|
    #raise self.buy_details.inspect

      headers = [
        'Marca',
        'Modelo',
        'Estado',
        'Precio',
        'Fecha'
      ]

      csv << headers

      all.each do |detail|
        csv << [
          detail.model.trademark.name,
          detail.model.name,
          detail.state.name,
          detail.price,
          detail.created_at.strftime('%d/%m/%Y %H:%M:%S')
        ]
      end
    end
  end

  private

  def calculate_price!
    self.price = calculate_price
  end
end
