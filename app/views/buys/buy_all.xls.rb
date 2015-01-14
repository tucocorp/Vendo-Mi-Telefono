<?xml version="1.0"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
  xmlns:o="urn:schemas-microsoft-com:office:office"
  xmlns:x="urn:schemas-microsoft-com:office:excel"
  xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
  xmlns:html="http://www.w3.org/TR/REC-html40">
  <Worksheet ss:Name="Sheet1">
    <Table>
      <Row>
        <Cell><Data ss:Type="String">marca</Data></Cell>
        <Cell><Data ss:Type="String">modelo</Data></Cell>
        <Cell><Data ss:Type="String">estado</Data></Cell>
        <Cell><Data ss:Type="String">precio</Data></Cell>
        <Cell><Data ss:Type="String">Fecha de emisión</Data></Cell>
      </Row>
    <% @buys.each do |detail| %>
      <Row>
        <Cell><Data ss:Type="Number"><%= detail.model.trademark.name %></Data></Cell>
        <Cell><Data ss:Type="String"><%= detail.model.name %></Data></Cell>
        <Cell><Data ss:Type="String"><%= detail.state.name %></Data></Cell>
        <Cell><Data ss:Type="Number"><%= detail.price %></Data></Cell>
        <Cell><Data ss:Type="Number"><%= detail.buy.created_at.strftime('%d/%m/%Y') %></Data></Cell>
      </Row>
    <% end %>
    </Table>
  </Worksheet>
</Workbook>