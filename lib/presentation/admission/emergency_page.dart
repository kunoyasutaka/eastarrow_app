import 'package:eastarrow_app/presentation/admission/emergency_detail/emergency_accident_page.dart';
import 'package:eastarrow_app/presentation/admission/emergency_detail/emergency_repair_page.dart';
import 'package:eastarrow_app/presentation/admission/emergency_model.dart';
import 'package:eastarrow_app/presentation/common/dialog.dart';
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
            endDrawer: const Drawer(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: const Text(
                      '緊急連絡',
                      style: TextStyle(fontSize: 20),
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
                        const Text('事故や故障などの場合は下のボタンから詳細を入力していただくと、店舗へメッセージが送信されます。\n内容を確認後、直ちに担当者よりお電話させていただきます。'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text('事故・保険の場合'),
                                  ElevatedButton.icon(
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
                                    label: const Text('詳細を入力する'),
                                    icon: const Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text('修理・整備の場合'),
                                  ElevatedButton.icon(
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
                                    label: const Text('詳細を入力する'),
                                    icon: const Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                      style: TextStyle(fontSize: 20),
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
                        const Text('緊急時は下のボタンを押してください。\n店舗へ電話がつながります。'),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => showConfirmDialog(context, '店舗に電話します。\nよろしいですか。'),
                            icon: const Icon(Icons.phone),
                            label: const Text('店舗に電話する （TEL:0574-62-4200）'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
