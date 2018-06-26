FactoryBot.define do
  factory :edi_invoice, class: EdiInvoice do
    id 101
    edi_doc_num 'I-10235828'
    edi_vend_id 'COUTTS'
    edi_vend_inv_date { DateTime.parse('2013-07-23 00:00:00') }
    todo 'Rdy2Rcv'
    uni_inv_cre_date { DateTime.parse('2013-07-23 00:00:00') }
    edi_total_pieces 1
  end
end
