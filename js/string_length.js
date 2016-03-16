/*
getLengthWithEmoji("😄😄") -> 2
"😄😄".length -> 4
 */
function getLengthWithEmoji(text) {
    var emojiRegex = /([\uD800-\uDBFF][\uDC00-\uDFFF])/g;
    var emojis = text.match(emojiRegex); // find all emojis
    var noEmojiText = text.replace(emojiRegex, ""); // clear all emojis
    if (emojis) {
        return noEmojiText.length + emojis.length;
    }
    return text.length;
}
