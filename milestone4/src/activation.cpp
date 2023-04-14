#include "activation.h"

void ActivationStack::push(ActivationRecord* ar) {
    stack_.push_back(ar);
}

ActivationRecord* ActivationStack::pop() {
    if (stack_.empty()) {
        return nullptr;
    }
    ActivationRecord* ar = stack_.back();
    stack_.pop_back();
    return ar;
}

ActivationRecord* ActivationStack::top() {
    if (stack_.empty()) {
        return nullptr;
    }
    return stack_.back();
}

bool ActivationStack::is_empty() {
    return stack_.empty();
}