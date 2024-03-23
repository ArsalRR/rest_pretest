import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_app/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Diri'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.profiles.length,
          itemBuilder: (context, index) {
            var profile = controller.profiles[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(profile['picture']['large']),
                    radius: 30,
                  ),
                  title: Text(
                    '${profile['name']['last']} ${profile['name']['first']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kota: ${profile['location']['city']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Negara: ${profile['location']['country']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Jenis Kelamin: ${profile['gender']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                        },
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.info
                        ),
                        onPressed: () {
                        },
                      
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
