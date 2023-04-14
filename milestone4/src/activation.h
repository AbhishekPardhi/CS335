#ifndef ACTIVATION_H
#define ACTIVATION_H

#include <bits/stdc++.h>

using namespace std;

struct ActivationRecord {
    vector<int> parameters;
    vector<int> locals;
    vector<int> temporaries;
    int return_value;
    ActivationRecord* control_link;
    ActivationRecord* access_link;
    // Exception handling information
};

class ActivationStack {
public:
    void push(ActivationRecord* ar);
    ActivationRecord* pop();
    ActivationRecord* top();
    bool is_empty();
    
private:
    vector<ActivationRecord*> stack_;
};

#endif // ACTIVATION_H