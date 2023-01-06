import 'package:flutter/material.dart';

import '../../domain/entities/github/repo.dart';
import '../../infra/utils/launch_url.dart';

class ProjectComponentWidget extends StatelessWidget {
  final Repo repo;

  const ProjectComponentWidget({Key? key, required this.repo})
      : super(key: key);

  void onProjectClick() {
    launchURL(repo.htmlUrl);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: InkWell(
        onTap: onProjectClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 60,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          repo.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 2.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          repo.stargazersCount.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: repo.fork?Colors.redAccent.shade100: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 2.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call_split,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          repo.forks.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                repo.description ?? '',
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 10.0,
              ),

              Visibility(
                visible: repo.language != null,
                child: Row(
                children: [
                  Icon(
                    Icons.code,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    repo.language ?? '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
