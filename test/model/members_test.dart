import 'package:unittest/unittest.dart';
import 'package:association/association.dart';

testMembers() {
  var model = new MembershipModel();
  Members members = model.members;
  var robert = 'rwm@gmail.com';
  var ogden = 'ogdenr@gmail.com';
  var anne = 'anned@gmail.com';
  group('Testing Members', () {
    test('Add member', () {
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Mantha';
      member.firstName = 'Robert';
      member.email = robert;
      var count = members.count;
      members.add(member);
      expect(members.count, equals(++count));
      members.display('Add member');
    });
    test('Update member', () {
      var member = members.find(robert);
      expect(member, isNotNull);
      var email = 'robert.mantha@gmail.com';
      member.email = email;
      expect(member.email, equals(email));
      members.display('Update member');
    });
    test('Add member, update member, remove member', () {
      var count = members.count;
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Daneault';
      member.firstName = 'Anne';
      member.email = anne;
      members.add(member);
      count++;

      var name = 'Anne Marie';
      member.firstName = name;
      expect(member.firstName, equals(name));

      members.remove(member);
      expect(members.count, equals(--count));

      members.display('Add member, update member, remove member');
    });
  });
}

main() {
  testMembers();
}

