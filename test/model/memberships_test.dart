import 'package:unittest/unittest.dart';
import 'package:association/association.dart';

testMemberships() {
  var model = new MembershipModel();
  Members members = model.members;
  Associations associations = model.associations;
  var dzenan = 'dzenanr@gmail.com';
  var readingClub = 'Books with prizes';
  group('Testing Memberships', () {
    test('Add membership', () {
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Ridjanovic';
      member.firstName = 'Dzenan';
      member.email = dzenan;
      var count = members.count;
      members.add(member);
      expect(members.count, equals(++count));
      members.display('Add member');

      var association = new Association();
      expect(association, isNotNull);
      association.name = readingClub;
      association.description = 'reading books that won prizes';
      count = associations.count;
      associations.add(association);
      expect(associations.count, equals(++count));
      associations.display('Add association');

      var membership = new Membership();
      expect(membership, isNotNull);
      membership.member = member;
      membership.association = association;
      membership.description = 'write a paper';
      count = member.memberships.count;
      member.memberships.add(membership);
      expect(member.memberships.count, equals(++count));
      member.memberships.display('Add member membership');
      count = association.memberships.count;
      association.memberships.add(membership);
      expect(association.memberships.count, equals(++count));
      association.memberships.display('Add association membership');
    });
  });
}

main() {
  testMemberships();
}

