import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/modules/produtos/repository/produtos_repository.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/services/response.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/double_formatter.dart';

class ProdutosController extends GetxController{
  final ProdutosRepository _produtosRepository = ProdutosRepository();
  Rx<CustomResponse<List<ProdutosModel>>> produtos = CustomResponse<List<ProdutosModel>>.none().obs;
  RxBool listView = false.obs;  


  Future<PlatformFile> pickProductImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if(result == null){
      throw CustomException(message: 'Nenhum arquivo selecionado');
    }
    return result.files.single;
  }


  getProdutos()async{
    try{
      produtos.value = CustomResponse.loading();
      produtos.value = CustomResponse.completed(data: await _produtosRepository.getProdutos());
    }
    catch(e){
      produtos.value = CustomResponse.error(error: CustomException(message: e.toString()));
    } 
  }

  deleteProduto(int id)async{
    try{
      await _produtosRepository.deleteProduto(id);
    }
    catch(e){
      throw CustomException(message: e.toString());
    } 
  }

  searchProducts(String nome)async{
    try{
      produtos.value = CustomResponse.loading();
      produtos.value = CustomResponse.completed(data: await _produtosRepository.searchProducts(nome));
    }
    catch(e){
      produtos.value = CustomResponse.error(error: CustomException(message: e.toString()));
    } 
  }

  ProdutosModel setProduto({required String descricao, required String nomeEtiqueta, 
  required String preco, required int categoria, required String imagem, required Color color,
  required String estoque, required String estoqueMinimo}){
    try{
      ProdutosModel produtosModel = ProdutosModel();
      produtosModel.descricao = descricao;
      produtosModel.nomeEtiqueta = nomeEtiqueta;
      produtosModel.preco = DoubleFormatterUtil.fromStringToDouble(value: preco);
      produtosModel.categoria.id = categoria;
      produtosModel.imagem = imagem;
      produtosModel.color = ColorFormatterUtils.formatColor(color: color);
      produtosModel.estoque = DoubleFormatterUtil.fromStringToDouble(value: estoque);
      produtosModel.estoqueMinimo = DoubleFormatterUtil.fromStringToDouble(value: estoqueMinimo);
      return produtosModel;
    }
    catch(e){
      throw CustomException(message: e.toString());
    } 
  }


  setProdutoApi({required ProdutosModel produto})async{
    try{
      await _produtosRepository.setProduto(produto);
    }
    catch(e){
      throw CustomException(message: e.toString());
    } 
  }

  Future<void> updateProdutoApi({required ProdutosModel produto})async{
    try{
      await _produtosRepository.updateProdutos(produtosModel: produto);
    }
    catch(e){
      throw CustomException(message: e.toString());
    } 
  }
}