require "spec_helper"

describe "Segmentação de Leads" do

  before do
    visit SegmentacaoLeadPage
  end

  it "verifica totalizador de lista de segmentação por filtro" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação"
    expect( on(SegmentacaoLeadPage).totalizador_grid_segmentacao_leads).to match(/1 a 4 de 4 \(filtrado de 9\)/)
  end

  it "cria e exclui lista de segmentação de leads" do
    on(SegmentacaoLeadPage).bt_criar_segmentacao
    on(SegmentacaoLeadSectionPage).criar_nova_lista_segmentacao "Segmentação 05"
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Lista salva com sucesso!/)
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 05"
    expect( on(SegmentacaoLeadPage).totalizador_grid_segmentacao_leads ).to match(/1 a 1 de 1 \(filtrado de 10\)/)
    on(SegmentacaoLeadPage).confirm(true) do
      on(SegmentacaoLeadPage).selecionar_mostrar_leads "Excluir lista"
    end
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Lista excluída com sucesso!/)
  end

  it "mostra leads de lista de segmentação de leads" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 01"
    on(SegmentacaoLeadPage).bt_mostrar_leads
    expect(on(LeadsPage).totalizador_grid_leads).to match(/1/)
  end

  it "edita lista de segmentação de leads" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 02"
    on(SegmentacaoLeadPage).selecionar_mostrar_leads "Editar"
    expect( on(SegmentacaoLeadSectionPage).nome_segmentacao ).to match(/Segmentação 02 editado/)
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Lista atualizada com sucesso!/)
  end

  it "duplica lista de segmentação de leads" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 03"
    on(SegmentacaoLeadPage).selecionar_mostrar_leads "Duplicar"
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Lista duplicada com sucesso!/)
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 03 - Duplicado"
    expect( on(SegmentacaoLeadPage).totalizador_grid_segmentacao_leads ).to match(/1 a 1 de 10 \(filtrado de 10\)/)
  end

  it "exclui lista de segmentação de leads duplicada" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 03 - Duplicado"
    message = on(SegmentacaoLeadPage).confirm(true) do
      on(SegmentacaoLeadPage).selecionar_mostrar_leads "Excluir lista"
    end
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Lista excluída com sucesso!/)
  end

  it "exporta conversões de segmentação de leads" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 01"
    on(SegmentacaoLeadPage).selecionar_mostrar_leads "Exportar conversões"
    on(SegmentacaoLeadPage).exportar_conversoes("scambaw@gmail.com", "CSV padrão")
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Arquivo enviado com sucesso./)
  end

  it "exclui leads de uma segmentação de leads" do
    on(SegmentacaoLeadPage).digitar_campo_buscar "Segmentação 01"
    on(SegmentacaoLeadPage).selecionar_mostrar_leads "Apagar Leads"
    expect(on(SegmentacaoLeadPage).apagar_leads).to match(/Apagar Leads/)
    expect(on(SegmentacaoLeadPage).verificar_msg_sucesso).to match(/Os Leads da lista que você selecionou serão deletados em instantes./)
  end

end
