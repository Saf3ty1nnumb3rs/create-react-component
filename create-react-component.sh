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
    cd "$COMPONENTS"
fi

COMPONENTNAME=${1?Error: Enter a name for your component}

mkdir $COMPONENTNAME

cd $COMPONENTNAME

touch $COMPONENTNAME-styles.js

echo "// import styled from 'styled-components'" >$COMPONENTNAME-styles.js

touch $COMPONENTNAME.jsx

echo "import React from 'react';

const $COMPONENTNAME = () => {
    return (
        <div>

        </div>
    );
};

export default $COMPONENTNAME;" >$COMPONENTNAME.jsx

touch $COMPONENTNAME.test.js

echo  "import React from 'react';
import ReactDOM from 'react-dom';
import $COMPONENTNAME from './$COMPONENTNAME';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<$COMPONENTNAME />, div);
  ReactDOM.unmountComponentAtNode(div);
});" >$COMPONENTNAME.test.js

touch package.json

echo "{
    \"main\":  \"$COMPONENTNAME.jsx\"
}" >package.json

cd "../../../"