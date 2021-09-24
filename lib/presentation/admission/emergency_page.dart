import 'package:eastarrow_app/presentation/admission/emergency_detail/emergency_accident/emergency_accident_page.dart';
import 'package:eastarrow_app/presentation/admission/emergency_detail/emergency_repair/emergency_repair_page.dart';
import 'package:eastarrow_app/presentation/admission/emergency_model.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmergencyModel(),
      child: Consumer<EmergencyModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('緊急連絡'),
              centerTitle: true,
            ),
            endDrawer: const DrawerList(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: const Text(
                        '緊急連絡',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '事故や故障などの場合は下のボタンから詳細を入力していただくと、店舗へメッセージが送信されます。\n内容を確認後、直ちに担当者よりお電話させていただきます。',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            '・事故・保険のお問い合わせ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      child: const EmergencyAccidentPage(),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                '詳細を入力する',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '・修理・整備のお問い合わせ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      child: const EmergencyRepairPage(),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                '詳細を入力する',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Text(
                        '緊急通話',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '緊急時は下のボタンを押してください。\n店舗へ電話がつながります。',
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                  model.phoneCall();
                              },
                              icon: const Icon(Icons.phone),
                              label: const Text(
                                '店舗に電話する',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
