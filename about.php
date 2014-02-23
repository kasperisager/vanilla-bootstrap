<?php if (!defined('APPLICATION')) exit();

$ThemeInfo['bootstrap'] = array(
  'Name'        => 'Bootstrap',
  'Description' => "<strong>NOW INCLUDES THE BOOTSWATCH THEMES!</strong> Bootstrap for Vanilla has been rewritten from scratch on top of <a href='http://getbootstrap.com'>Bootstrap 3</a> in this second installation of the most popular theme for Vanilla Forums. Kickstart your community with a fresh and solid theme that is ready to be customized to your heart's desires.",
  'Version'     => '2.0.6',
  'Author'      => 'Kasper K. Isager',
  'AuthorEmail' => 'kasperisager@gmail.com',
  'AuthorUrl'   => 'https://github.com/kasperisager',
  'RequiredApplications' => array('Vanilla' => '2.2.x'),

  'Options' => array(
    'Styles' => array(
      'Default' => array(
        'Basename' => '%s_default',
        'Description' => 'Better, faster and stronger'
      ),
      'Bootstrap' => array(
        'Basename' => '%s_bootstrap',
        'Description' => 'A visually enhanced experience'
      ),
      'Amelia' => array(
        'Basename' => '%s_amelia',
        'Description' => 'Sweet and cheery'
      ),
      'Cerulean' => array(
        'Basename' => '%s_cerulean',
        'Description' => 'A calm blue sky'
      ),
      'Cosmo' => array(
        'Basename' => '%s_cosmo',
        'Description' => 'An ode to Metro'
      ),
      'Cyborg' => array(
        'Basename' => '%s_cyborg',
        'Description' => 'Jet black and electric blue'
      ),
      'Flatly' => array(
        'Basename' => '%s_flatly',
        'Description' => 'Flat and modern'
      ),
      'Journal' => array(
        'Basename' => '%s_journal',
        'Description' => 'Crisp like a new sheet of paper'
      ),
      'Lumen' => array(
        'Basename' => '%s_lumen',
        'Description' => 'Light and shadow'
      ),
      'Readable' => array(
        'Basename' => '%s_readable',
        'Description' => 'Optimized for legibility'
      ),
      'Simplex' => array(
        'Basename' => '%s_simplex',
        'Description' => 'Mini and minimalist'
      ),
      'Slate' => array(
        'Basename' => '%s_slate',
        'Description' => 'Shades of gunmetal gray'
      ),
      'Spacelab' => array(
        'Basename' => '%s_spacelab',
        'Description' => 'Silvery and sleek'
      ),
      'Superhero' => array(
        'Basename' => '%s_superhero',
        'Description' => 'The brave and the blue'
      ),
      'United' => array(
        'Basename' => '%s_united',
        'Description' => 'Ubuntu orange and unique font'
      ),
      'Yeti' => array(
        'Basename' => '%s_yeti',
        'Description' => 'A friendly foundation'
      )
    )
  )
);
