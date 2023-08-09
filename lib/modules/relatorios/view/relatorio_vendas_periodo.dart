// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sport_bar/modules/relatorios/model/relatorios_model.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/utils/extensions.dart';

class RelatorioVendasPeriodo extends StatelessWidget {
  final RelatoriosModel<VendasModel> relatoriosModel;
  const RelatorioVendasPeriodo({super.key, required this.relatoriosModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        pdfFileName: 'Vendas por Periodo.pdf',
        build: (format) => _generatePdf(format: format, title:  'Relatorio de Vendas por Periodo ${relatoriosModel.dataInicial} a ${relatoriosModel.dataFinal}',),
      ),
    );
  }

  Future<Uint8List> _generatePdf({required PdfPageFormat format, required String title})async{
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true, author: 'Hallyson Hugo', title: title);
    final font = await PdfGoogleFonts.ralewayBlack();
    double valorTotal = relatoriosModel.dados.fold(0, (previousValue, element) => previousValue + element.valorPago);
    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        build: (context){
          return <pw.Widget> [
            pw.Column(
              children: [
                pw.Text('Vendas por Periodo', style: pw.TextStyle(
                  fontSize: 20, 
                  fontWeight: pw.FontWeight.bold, 
                  font: font
                  )
                ),
                pw.Divider(),
                pw.SizedBox(height: 20),
                ...relatoriosModel.dados.map((venda){
                  return pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Id: ${venda.codigo}'),
                        pw.Text('Data: ${venda.data}'),
                        pw.Text('Valor: ${venda.valorPago.toCurrency()}'),
                        pw.Text('Desconto: ${venda.carrinho.desconto.toCurrency()}'),
                      ]
                    )
                  );
                }),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Valor Total: ${valorTotal.toCurrency()}'),
                    pw.Text('Quantidade de Vendas: ${relatoriosModel.dados.length}')
                  ]
                )
              ]
            )
          ];
        }
      )
    );
    return pdf.save();
  }
}