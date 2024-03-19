import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset('assets/pdfs/CC-24-Q1-L13.pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pdfReader(),
    );
  }

  Widget _pdfReader() {
    return Column(
      children: [
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(
        controller: pdfControllerPinch,
      ),
    );
  }
}
