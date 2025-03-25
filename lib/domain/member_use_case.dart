import 'package:prove_metro_app/data/member_repository.dart';
import 'package:prove_metro_app/models/members_model.dart';

class SaveMemberUseCase{

  final MemberRepository _memberRepository;

  SaveMemberUseCase(this._memberRepository);

  Future<void> saveMember(MembersModel member) async {
    await _memberRepository.saveMember(member);
  }

}


class GetMemberUseCase{

  final MemberRepository _memberRepository;

  GetMemberUseCase(this._memberRepository);

  MembersModel? getMember() {
    return _memberRepository.getMember();
  }

}