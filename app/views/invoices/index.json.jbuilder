json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :description, :amount, :issue_date, :client_id, :person_id
  json.url invoice_url(invoice, format: :json)
end
