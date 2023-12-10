import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/services/auth.dart';
import 'package:sports_iiitd/services/db.dart';

import '../common/colors.dart';
import 'manage_requests.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);
  final User? user = getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
          future: getStudentDocument(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                customAppBar("PROFILE", context, logo: true),

                // Profile Picture
                // Container(
                //   height: 120,
                //   width: 120,
                //   margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: NetworkImage(user!.photoURL!),
                //       fit: BoxFit.fill,
                //     ),
                //     border: Border.all(
                //       color: CustomColors.white,
                //       width: 3,
                //     ),
                //   ),
                // ),

                SizedBox(height: 60),
                Drawing(user!.photoURL!),

                // Name
                Text(
                  user!.displayName!.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white,
                    letterSpacing: 0.0,
                  ),
                ),
                Text(
                  '@${user!.email!.split('@')[0]}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: CustomColors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        profileButtons(
                          title: 'History',
                          icon: IconlyBold.time_square,
                          onTap: () {
                            Navigator.pushNamed(context, '/history');
                          },
                          subtitle: 'Your equipment/events records',
                          context: context,
                        ),
                        profileButtons(
                          title: 'Fines',
                          icon: IconlyBold.paper,
                          onTap: () {
                            Navigator.pushNamed(context, '/fines');
                          },
                          subtitle: 'Your fines history',
                          context: context,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    snapshot.data!.isSuperAdmin
                        ? profileButtons(
                            title: 'Requests',
                            icon: IconlyBold.paper,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ManageRequests(),
                              ));
                            },
                            subtitle: 'Manage issues/returns requests',
                            context: context,
                          )
                        : Container(),
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
                    backgroundColor: CustomColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: CustomColors.red),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: CustomColors.white),
                  ),
                )
              ],
            );
          }),
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
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.red),
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.red.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: CustomColors.red,
            size: 40,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: CustomColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: CustomColors.white.withOpacity(0.7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Drawing(imgPath) {
  return CustomPaint(
    painter: ProfilePainter(),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipOval(
        child: Image.network(
          imgPath,
          width: 120.0, // Adjust the size as needed
          height: 120.0,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / (1.2);

    // Draw 5 concentric circles
    for (int i = 0; i < 5; i++) {
      final paint = Paint()
        ..color =
            Colors.white.withOpacity((i + 1) / 5.0) // Linear opacity increase
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius - i * 20, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
