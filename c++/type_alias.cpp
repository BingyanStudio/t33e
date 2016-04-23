// Suppose we have such a type definition

typedef char* pstring;

// Now we let type pstring be an alias for the type type char*
// So we can define a constant pointer to char as follow

const pstring cstr = 0;

// However, we can't define aa constant pointer to char like this

const char* cstr = 0;

// The reason is that when we use pstring in a declaration, the base
// type of the declaration is a pointer type.However,when we rewrite
// rewrite the declaration using char*, the base type is char and '*'
// if part of the declarator.