#!/bin/bash

SRC="src"
COMPONENTS="components"

if [ -e "$SRC" ]; then
    cd "$SRC"
else
    mkdir "$SRC"
    cd "$SRC"
fi

if [ -e "$COMPONENTS" ]; then
    cd "$COMPONENTS"
else
    mkdir "$COMPONENTS"
    echo "  create    components"
    cd "$COMPONENTS"
fi

STYLETYPE=${1?Error: Enter a style type for your component}
COMPONENTNAME=${2?Error: Enter a name for your component}

mkdir $COMPONENTNAME

echo "  create    $COMPONENTNAME"

cd $COMPONENTNAME

case "$STYLETYPE" in
[cC][sS][sS])
    touch $COMPONENTNAME.css
    echo "  create    $COMPONENTNAME.css"
    ;;
[sS][tT][yY][lL][eE][dD][-][cC][oO][mM][pP][oO][nN][eE][nN][tT][sS])
    touch $COMPONENTNAME-styles.js
    echo "  create    $COMPONENTNAME-styles.js"
    echo "import styled from 'styled-components'

export {} " >$COMPONENTNAME-styles.js
    ;;
[sS][aA][sS][sS])
    touch $COMPONENTNAME.scss
    echo "  create    $COMPONENTNAME.scss"
    ;;
*)
    echo "Please select a style type"
    ;;
esac

touch $COMPONENTNAME.jsx

echo "  create    $COMPONENTNAME.jsx"

echo "import React from 'react';

const $COMPONENTNAME = () => {
    return (
        <div>

        </div>
    );
};

export default $COMPONENTNAME;" >$COMPONENTNAME.jsx

touch $COMPONENTNAME.test.js

echo "  create    $COMPONENTNAME.test.js"

echo "import React from 'react';
import ReactDOM from 'react-dom';
import $COMPONENTNAME from './$COMPONENTNAME';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<$COMPONENTNAME />, div);
  ReactDOM.unmountComponentAtNode(div);
});" >$COMPONENTNAME.test.js

touch package.json

echo "  create    package.json"

echo "{
    \"main\":  \"$COMPONENTNAME.jsx\"
}" >package.json

cd "../../../"

echo "
  $COMPONENTNAME Component created"
