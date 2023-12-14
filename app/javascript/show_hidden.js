const show_overflow_map = new Map();
const stylesheet = document.styleSheets[0];

function show(id) {
    if (show_overflow_map.has(id)) {
        return
    } else {
        let index_1 = stylesheet.insertRule(`div#${id} ul li.overflow {display: revert}`);
        let index_2 = stylesheet.insertRule(`div#${id} a.see_more {display: none}`);
        show_overflow_map.set(id, [index_1, index_2]);
    }
}
