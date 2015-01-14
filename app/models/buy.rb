class Buy < ActiveRecord::Base
  enum status: [ :pending, :finished ]

  has_many :buy_details , dependent: :destroy
  has_one :coupon
  
  belongs_to :customer
  belongs_to :member

  accepts_nested_attributes_for :buy_details

  def get_total_price
    total_value = 0
    self.buy_details.each do |d|
      unless d.price.nil?
        total_value += d.price   
      end 
    end
    return total_value
  end

  def self.to_csv(buy_excel)
    #raise buy_excel.inspect
    CSV.generate(col_sep: "\t") do |csv|

      headers = [
        'Marca',
        'Modelo',
        'Estado',
        'Precio',
        'Fecha'
      ]
       total_value=0
      csv << headers

      buy_excel.each do |buy|
        buy.buy_details.each do |detail|
          #raise detail.inspect
            total_value += detail.price 
          csv << [  
              detail.model.trademark.name,
              detail.model.name,
              detail.state.name,
              detail.price,
              detail.created_at.strftime('%d/%m/%Y %H:%M:%S')

          ] 
        end
      end
      csv << []
      csv << ['','','Total', total_value]
    end
  end
end
