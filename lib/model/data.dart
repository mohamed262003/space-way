class PlanetInfo {
  final int position;
  final String? name;
  final double? price;
  final int? duration;
  final String? iconImage;
  final String? description;
  final List<String>? images;
  final String mass;
  final String distanceFromEarth;
  final double gravity;
  final double size;

  PlanetInfo(
    this.position, {
    required this.mass,
    required this.distanceFromEarth,
    required this.gravity,
    required this.size,
    required this.name,
    required this.price,
    required this.duration,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(
    1,
    gravity: 3.7,
    name: 'Mercury',
    price: 1000,
    duration: 12,
    iconImage: 'assets/images/mercury.png',
    description:
        "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
    images: [
      'https://cdn.pixabay.com/photo/2013/07/18/10/57/mercury-163610_1280.jpg',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcVlHIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--bfcefdbb03ebe1d73fbe2e043abde222b35f1c08/PIA13508.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcVVFIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--271ff8be3125a1e3b9284c6b326bca3bea2dc590/PIA16853.jpg?disposition=attachment',
    ],
    mass: '3.30 x 10^23',
    distanceFromEarth: '48',
    size: 3.032,
  ),
  PlanetInfo(
    2,
    name: 'Venus',
    price: 800,
    duration: 7,
    iconImage: 'assets/images/venus.png',
    description:
        "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even hotter than Mercury. The average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets.",
    images: [
      'https://cdn.pixabay.com/photo/2011/12/13/14/39/venus-11022_1280.jpg',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcjhQIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ab0be61e3f61623e10ec25afdee91cc1a5db6830/PIA00148_1280.jpg?disposition=attachment',
    ],
    mass: '4.87 x 10^24',
    distanceFromEarth: '26',
    gravity: 8.87,
    size: 7.521,
  ),
  PlanetInfo(
    3,
    name: 'Earth',
    price: 300,
    duration: 1,
    iconImage: 'assets/images/earth.png',
    description:
        "The third planet from the sun, Earth is a waterworld, with two-thirds of the planet covered by ocean. It's the only world known to harbor life. Earth's atmosphere is rich in nitrogen and oxygen. Earth's surface rotates about its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).",
    images: [
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F1.jpg?alt=media&token=5a5ca5ad-22d5-45ff-842d-c649eaffeca4',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F2.jpg?alt=media&token=284eb9ef-5ee5-4668-8ef3-ece186bd3260',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F3.avif?alt=media&token=6b38c0cb-bbfc-4ced-bb2d-821eb6ab22ac',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F4.jpg?alt=media&token=48f2d62f-0a6e-4e1d-a646-1f7409548efc',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F5.jpg?alt=media&token=a44de9ff-d434-4d62-998e-de961f3b1f7e',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F6.jpg?alt=media&token=987c25b2-442b-42b7-8ecb-772936d165e2',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Earth%2F7.jpg?alt=media&token=b82e6bf3-f935-4cc9-98f2-5e333c53137e',
    ],
    mass: '5.97 x 10^24',
    distanceFromEarth: '',
    gravity: 9.8,
    size: 7.918,
  ),
  PlanetInfo(
    4,
    name: 'Mars',
    price: 1200,
    duration: 9,
    iconImage: 'assets/images/mars.png',
    description:
        "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. ",
    images: [
      'https://d2pn8kiwq2w21t.cloudfront.net/images/imagesmars20160421PIA00407-16.width-1320.jpg',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBaDRTIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57fdc4ee44fe502a585880710f8113dd538c2a08/marspolarcrater_1600.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcGNSIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--50b01c602bd1b0830fd2c2727220c4c1558e2ab5/PIA00567.jpg?disposition=attachment',
      'https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia25450.jpeg',
      'https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia24420.jpeg',
    ],
    mass: '6.42 x 10^23',
    distanceFromEarth: '140',
    gravity: 3.7,
    size: 4.212,
  ),
  PlanetInfo(
    5,
    name: 'Jupiter',
    price: 1500,
    duration: 13,
    iconImage: 'assets/images/jupiter.png',
    description:
        "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. And a major feature in its swirling clouds is the Great Red Spot, a giant storm more than 10,000 miles wide. It has raged at more than 400 mph for the last 150 years, at least. Jupiter has a strong magnetic field, and with 75 moons, it looks a bit like a miniature solar system.",
    images: [
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0FTIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d91c8056b0a4c3cd4cf6bcd3f7e6eda669270678/stsci-h-p1936a_1800.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbWdUIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--84ab61fca9faa459e90c2b331d40de0143de7d9e/Juno_Jupiter_Vortices-PIA25017-800x600.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0VUIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2a54b92286421b6fc40bd5ca38b116bcbb87a904/Galilean_Moons-800.jpg?disposition=attachment',
    ],
    mass: '1.90 x 10^27',
    distanceFromEarth: '484',
    gravity: 24.79,
    size: 86.881,
  ),
  PlanetInfo(
    6,
    name: 'Saturn',
    price: 2000,
    duration: 15,
    iconImage: 'assets/images/saturn.png',
    description:
        "The sixth planet from the sun, Saturn is known most for its rings. When polymath Galileo Galilei first studied Saturn in the early 1600s, he thought it was an object with three parts: a planet and two large moons on either side. Not knowing he was seeing a planet with rings, the stumped astronomer entered a small drawing — a symbol with one large circle and two smaller ones — in his notebook, as a noun in a sentence describing his discovery. More than 40 years later, Christiaan Huygens proposed that they were rings. The rings are made of ice and rock and scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons.",
    images: [
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ2NTIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--381c53bc39247134629366ca6731e1ca801c7473/stsci-h-p1943a-f_1200.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdHdEIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3fec7f1e74056801816a435a1e7c45f3b3eacf4c/PIA01364.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcHMyIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8c39a8c4e4f2137b99400257a44e3b4ed398af99/PIA12797-full.jpg?disposition=attachment',
      'https://solarsystem.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBaEFFIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0c65535256806995650187ee1047e8f88895be2e/5678_IMG004678.jpg?disposition=attachment'
    ],
    mass: '5.68 x 10^26',
    distanceFromEarth: '886',
    gravity: 8.87,
    size: 72.367,
  ),
  PlanetInfo(
    7,
    name: 'Uranus',
    price: 2400,
    duration: 18,
    iconImage: 'assets/images/uranus.png',
    description: '''The seventh planet from the sun, Uranus is an oddball. 
        It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. 
        It rotates from east to west like Venus. But unlike Venus or any other planet, 
        its equator is nearly at right angles to its orbit — it basically orbits on its side. 
        Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. 
        That tilt causes extreme seasons that last 20-plus years, 
        and the sun beats down on one pole or the other for 84 Earth-years at a time. ''',
    images: [
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Uranus%2F1.jpg?alt=media&token=564ab0bc-3814-4a7a-803d-3a0eebadc06b',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Uranus%2F2.jpg?alt=media&token=6eb59a49-92b1-4dd1-aaa6-af1251239c8d',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Uranus%2F3.jpg?alt=media&token=2747cfff-f9d3-4780-b233-5bc49e60c212',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Uranus%2F4.jpg?alt=media&token=5bff5314-1ac7-4f83-b90c-6a85eacd8dfa',
    ],
    mass: '8.68 x 10^25',
    distanceFromEarth: '1,79000',
    gravity: 8.87,
    size: 31.763,
  ),
  PlanetInfo(
    8,
    name: 'Neptune',
    price: 3000,
    duration: 22,
    iconImage: 'assets/images/neptune.png',
    description:
        '''The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds.
         Neptune is far out and cold. The planet is more than 30 times as far from the sun as Earth. 
         Neptune was the first planet predicted to exist by using math,
         before it was visually detected. 
         Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug.
         German astronomer Johann Galle used calculations to help find Neptune in a telescope.
         Neptune is about 17 times as massive as Earth and has a rocky core.''',
    images: [
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Neptune%2F1.jpg?alt=media&token=0336ed32-329f-438c-a8d9-975eab399d64',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Neptune%2F2.jpg?alt=media&token=18ae2332-52f8-445f-83ef-c2844124d268',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Neptune%2F3.jpg?alt=media&token=99c49244-474e-4177-bac7-d7c4565b34db',
      'https://firebasestorage.googleapis.com/v0/b/nasa-space-apps-3caf1.appspot.com/o/Neptune%2F4.jpg?alt=media&token=11cc132a-02e9-41dc-9a74-e23e4ad2fd26',
    ],
    mass: '1.02 x 10^26',
    distanceFromEarth: '2,7000',
    gravity: 11.15,
    size: 30.776,
  ),
];

List elevators = [
  'assets/images/elevators/WhatsApp Image 2023-10-05 at 15.12.50_ce780909.jpg',
  'assets/images/elevators/0dae2b91bb591946181ddac83d1d82c3.jpg',
  'assets/images/elevators/space-elevator.jpg',
];

List spaceShips = [
  'assets/images/space_ships/pexels-spacex-60130.jpg',
  'assets/images/space_ships/rocket-flying-through-space_23-2150378598.jpg',
];

List activities = [
  'Walk in Space',
  'Watching Stars',
  'Zero-gravity Sports',
  'Space Tourism Festival',
  'Snorkeling',
];
