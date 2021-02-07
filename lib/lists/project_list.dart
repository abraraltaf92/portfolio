import '../models/projects.dart';

final List<Project> projectList = [
  Project(
    id: 0,
    title: 'Spartan BREW CREW',
    description: 'Spartan Brew Crew is a mobile app',
    //  that keeps track of team members’ brew preferences and was built using Flutter and Firebase as backend in realtime manipulation of data. It allows users to change the strength of their brew and sugar intake.',
    image: 'images/sBC.jpg',
    link: 'https://github.com/abraraltaf92/spartan_brew_crew.git',
  ),
  Project(
    id: 1,
    title: 'CurrentLoc',
    description: 'Developed a simple two page Login ',
    // / Sign Up app with Google Sign In Authentication, email and password Authentication, email verification, forgot password , delete user account, logout etc features integrated with Firebase as backend AND HomePage integrated with Google MAPS showing currentLocation the moment you login successfully.',
    image: 'images/cL.jpg',
    link: 'https://github.com/abraraltaf92/currentLoc.git',
  ),
  Project(
    id: 2,
    title: 'Python Projects',
    description: 'These are some python Projects',
    //  which helped me in developing interest and also boost up my confidence.',
    image: 'images/pP.jpg',
    link: 'https://github.com/abraraltaf92/Chotu_chat_bot.git',
  ),
  Project(
    id: 3,
    title: 'World Time',
    description: 'A simple flutter two page app',
    //  displaying current time of selected country by making http requests to world time api and the time displayed reflects with the same environment that is dark theme for night and bright for day.',
    image: 'images/wT.jpg',
    link: 'https://github.com/abraraltaf92/World_Time.git',
  ),
];
