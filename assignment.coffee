1-QUESTION
------------------------------------------------------------------------------------------------------

This List Component is used to display an unordered List with some texts as List items.
WrappedListComponent creates an unordered list. It takes an array (items) of strings(text) as props.
For each item in the array, it maps through all and displays their content on the screen with a background color of 'Red'. 
If one item is selected, then it displays it with a different background color (Green).
The user can click on an item and it will get selected and will get background color of Green.

2-QUESTION
-------------------------------------------------------------------------------------
onClick events should have a function reference instead of a function call.
<li style={{ backgroundColor: isSelected ? "green" : "red" }}
     onClick={onClickHandler(index)}>
      {text}
</li>
useState variables being misplaced.

const [setSelectedIndex, selectedIndex] = useState();
-> Passing a number selectedIndex to isSelected which should be a bool.
<ul style={{ textAlign: "left" }}>
    {items.map((item, index) => (
     <SingleListItem
       onClickHandler={() => handleClick(index)}
       text={item.text}
       index={index}
       isSelected={selectedIndex}
     />
   ))}
</ul>
Defining a default prop as null is not recommended.
WrappedListComponent.defaultProps = {
    items: null,
  };
  Unique key prop is missing for List items.
  <ul style={{ textAlign: 'left' }}>
    {items.map((item, index) => (
      <SingleListItem
        onClickHandler={() => handleClick(index)}
        text={item.text}
        index={index}
        isSelected={selectedIndex}
      />
    ))}
</ul>
Syntax errors in the following code
WrappedListComponent.propTypes = {
  items: PropTypes.array(
    PropTypes.shapeOf({
      text: PropTypes.string.isRequired,
    })
  ),
};


3-QUESTION
------------------------------------------------------------------------------------------
import React, { useState, useEffect, memo } from 'react';
import PropTypes from 'prop-types';
const WrappedSingleListItem = ({
    index,
    isSelected,
    onClickHandler,
    text,
}) => {
    return (
        <li
            style={{ backgroundColor: isSelected ? 'green' : 'red' }}
            onClick={() => onClickHandler(index)}
        >
            {text}
        </li>
    );
};
WrappedSingleListItem.propTypes = {
    index: PropTypes.number,
    isSelected: PropTypes.bool,
    onClickHandler: PropTypes.func.isRequired,
    text: PropTypes.string.isRequired,
};
const SingleListItem = memo(WrappedSingleListItem);
const WrappedListComponent = ({ items, }) => {
    const [selectedIndex, setSelectedIndex] = useState();

    useEffect(() => {
        setSelectedIndex(null);
    }, [items]);

    const handleClick = index => {
        setSelectedIndex(index);
    };

    return (
        <ul style={{ textAlign: 'left' }}>
            {items.map((item, index) => (
                <SingleListItem
                    key={index}
                    onClickHandler={() => handleClick(index)}
                    text={item.text}
                    index={index}
                    isSelected={Boolean(selectedIndex)}
                />
            ))}
        </ul>
    )
};
WrappedListComponent.propTypes = {
    items: PropTypes.arrayOf(PropTypes.shape({
        text: PropTypes.string.isRequired,
    }).isRequired
    ).isRequired
};
WrappedListComponent.defaultProps = {
    items: undefined 
};
const List = memo(WrappedListComponent);
export default List;