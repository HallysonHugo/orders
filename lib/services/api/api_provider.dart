class ApiProvider{
  static ProdutosApi produtosApi = ProdutosApi();
  static VendasApi vendasApi = VendasApi();
  static CategoriasApi categoriasApi = CategoriasApi();
  static ConfiguracoesApi configuracoesApi = ConfiguracoesApi();
  static ItVendasApi itVendasApi = ItVendasApi();
}


class ProdutosApi{
  String get produtos => '/produtos';
  String get search => '/produtos/search';
}

class VendasApi{
  String get vendas => '/vendas';
}

class CategoriasApi{
  String get categorias => '/categorias';
}

class ConfiguracoesApi{
  String get configuracoes => '/configuracoes';
}

class ItVendasApi{
  String get itVendas => '/itVendas';
}
