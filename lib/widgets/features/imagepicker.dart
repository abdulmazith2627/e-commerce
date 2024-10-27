import 'package:file_picker/file_picker.dart';


 imagepicker(fileType,withData)async{
  FilePickerResult? filePickerResult =await FilePicker.platform.pickFiles(
    type:fileType,
    withData:withData
  );
}