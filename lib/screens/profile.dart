import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/services/auth.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);
  final User? user = getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.white, size: 32),
                color: Colors.white,
              ),
            ],
          ),

          // Profile Picture
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user!.photoURL!),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
          ),

          // Name
          Text(
            user!.displayName!.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '@${user!.email!.split('@')[0]}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              profileButtons(
                title: 'Events',
                icon: IconlyBold.ticket_star,
                onTap: () {},
                subtitle: 'Your past events',
                context: context,
              ),
              profileButtons(
                title: 'History',
                icon: IconlyBold.time_square,
                onTap: () {},
                subtitle: 'Your equipment records',
                context: context,
              ),
              profileButtons(
                title: 'Fines',
                icon: IconlyBold.paper,
                onTap: () {},
                subtitle: 'Your fines history',
                context: context,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign_in', (route) => false);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

InkWell profileButtons(
    {required String title,
    required IconData icon,
    required Function() onTap,
    required String subtitle,
    required BuildContext context}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width / 3 - 34,
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
        color: Colors.red.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 40,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
