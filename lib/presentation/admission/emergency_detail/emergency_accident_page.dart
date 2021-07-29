import 'package:eastarrow_app/presentation/admission/emergency_model.dart';
import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmergencyAccidentPage extends StatelessWidget {
  const EmergencyAccidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmergencyModel(),
      child: Consumer<EmergencyModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: const Text(
                  '事故・保険についての詳細入力',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ご自身の証券番号',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          autofocus: false,
                          controller: TextEditingController(),
                          keyboardType: TextInputType.text,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '車両の損傷状況',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          autofocus: false,
                          controller: TextEditingController(),
                          maxLines: 2,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.text,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'ケガの有無',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          autofocus: false,
                          controller: TextEditingController(),
                          maxLines: 2,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.text,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '相手方の情報',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          autofocus: false,
                          controller: TextEditingController(),
                          maxLines: 2,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.text,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '事故の状況',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          autofocus: false,
                          controller: TextEditingController(),
                          maxLines: 2,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.text,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async => await showConfirmDialog(context, 'ご記入いただいた内容を送信します。\nよろしいですか？'),
                              child: const Text('こちらの内容で送信'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
