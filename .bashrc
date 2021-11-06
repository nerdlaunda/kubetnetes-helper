
#CUSTOM-ALIAS-BEGIN-K8S
alias k='kubectl'
complete -F __start_kubectl k

source <(kubectl completion bash)
do="--dry-run=client -o yaml"

# get 
alias kg='kubectl get'
alias kgp='kubectl get pods'
function kgpw(){
    kubectl get pod $1 -o wide
}
alias kgpa='kubectl get pods -A'
alias kgpn='kubectl get pods -n'
alias kgpn='kubectl get pods -o wide'
alias kgpwa='kubectl get pod -o wide -A'
alias kgpwn='kubectl get pod -o wide -n'
fucntion kgpy {
    kubectl get pod $@ -o yaml
}

alias kgd='kubectl get deployment'
alias kgda='kubectl get deployment -A'
alias kgdn='kubectl get deployment -n'
alias kgdwa='kubectl get deployment -o wide -A'
alias kgdwn='kubectl get deployment -o wide -n'
fucntion kgdy {
    kubectl get deployment $@ -o yaml
}

alias kgpp='kubectl get pv,pvc'
alias kgppa='kubectl get pv,pvc -A'
alias kgppn='kubectl get pv,pvc -n '
alias kgs='kubectl get svc'
alias kgsa='kubectl get svc -A'
alias kgsn='kubectl get svc -n '
alias kgn='kubectl get nodes'
alias kgnw='kubectl get nodes -o wide'


# get yaml & dryrun
function kcpy() {
    kubectl run $@ -o yaml --dry-run=client 
}
function kcdy() {
    kubectl create deployment $@ -o yaml --dry-run=client
}

# describe
alias kd='kubectl describe'
function kdp{
    kubectl describe pod $@
}
function kdd{
    kubectl describe deploy $@
}
alias kddn='kubectl describe deployment -n'
alias kds='kubectl describe svc'
alias kdsn='kubectl describe svc -n'
alias kdn='kubectl get node'

# edit
alias ke='kubectl edit'

# scale
function kscale() { 
    kubectl scale deployment $1 --replicas=$2 
}

# update image
function ksetim() {
    kubectl set image deployment $@
}

# apply
alias kaf='kubectl apply -f'

# deletetion
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
alias krmfo='kubectl delete --force'
alias krmp='kubectl delete pod'
alias krmd='kubectl delete deployment'
alias krmpfo='kubectl delete --force pod'
alias krmdfo='kubectl delete --force deployment'

# get bash/sh
function kshell() { 
    kubectl exec -ti $@ -- sh;
}
function kcbash() { 
    kubectl exec -ti $@ -- bash;
}
function kexec() {
    kubectl exec -ti $1 -n $2 -- $3
}

function ktmpr{
    kubectl run -it --rm testbox --image=$1 -n $2 --restart=Never -- sh
}
# info
alias kcinfo='kubectl cluster info'

#CUSTOM-ALIAS-END-K8S
