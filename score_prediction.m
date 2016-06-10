function [overall_accuracy, per_class_accuracy] = score_prediction(test_labels, predicted_labels)
[m n]=size(predicted_labels);

T=0;
for i=1:m
    c=0;
    for j=1:n
        if(predicted_labels(i,j)==test_labels(i))
            c=c+1;T=T+1;
        end
    end
    per_class_accuracy(i)=c*100/n;
end
per_class_accuracy;

overall_accuracy=sum(per_class_accuracy)/nnz(per_class_accuracy);
