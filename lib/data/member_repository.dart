import 'package:hive/hive.dart' show Box;
import 'package:prove_metro_app/models/members_model.dart';

abstract class MemberRepository{
  Future<void> saveMember(MembersModel member);
  MembersModel? getMember();
}

class MemberRepositoryImpl implements MemberRepository{

  final Box<MembersModel> _memberBox;


  MemberRepositoryImpl(this._memberBox);

  @override
  MembersModel? getMember() {
    return _memberBox.values.first;
  }

  @override
  Future<void> saveMember(MembersModel member) async {
    await _memberBox.put(member.idPersona, member);
  }

}