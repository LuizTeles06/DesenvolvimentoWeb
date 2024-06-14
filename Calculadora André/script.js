
let numbers_stack = [];
let operator_stack = [];
let number_complete = false;

function appendToDisplay(value) {
    let display = document.getElementById("display");
    // zera o display para inserção de novo número
    if (number_complete) 
        clearDisplay();
    // não permite repetição de zero a esquerda e de pontos
    if (!(display.value == '0' && value == '0') && 
       (value != '.' || display.value.indexOf('.') < 0)) {
            // não permite zero a esquerda
            if (display.value == '0' && value != '.') {
                display.value = value;
            } else {
                display.value += value;
            }
    }
}

function operator(value) {
    if (!number_complete) {
        addNumberToStack();
        addOperatorToStack(value);
    } else {
        remOperatorFromStack(value);
        addOperatorToStack(value);
    }
    
}

function calculate() {
    addNumberToStack();
    // alert(numbers_stack + '\n' + operator_stack);
    
    let result = partialCalculate();
    document.getElementById("display").value = result;
    number_complete = false;

    // reset temporário
    numbers_stack = [];
    operator_stack = []; 
}

function clearDisplay() {
    document.getElementById("display").value = "";
    number_complete = false;
}

function backspace() {
    var displayValue = document.getElementById("display").value;
    document.getElementById("display").value = displayValue.substring(
        0, displayValue.length - 1
    );
}

function addNumberToStack() {
    let number = document.getElementById("display").value;
    number_complete = true;
    numbers_stack.push(number);
}

function addOperatorToStack(value) {
    operator_stack.push(value);
}

function remOperatorFromStack(value) {
    operator_stack.pop();
}

function partialCalculate() {
    let n2 = numbers_stack.pop();
    let n1 = numbers_stack.pop();
    let op = operator_stack.pop();
    let result = eval(n1 + op + n2);
    return result;
}
