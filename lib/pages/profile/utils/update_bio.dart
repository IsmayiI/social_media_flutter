import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

import 'utils.dart';

// обновить био
void updateBio(BuildContext context, TextEditingController controller) {
  context.read<UserProvider>().updateBio(controller.text.trim());
  closeDialog(context, controller);
}
