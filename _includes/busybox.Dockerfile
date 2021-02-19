FROM busybox

ENTRYPOINT ["sh", "-c", "echo $0 fixed_part $*"]

CMD [""]